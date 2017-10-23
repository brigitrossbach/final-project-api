require 'rest-client'
require 'google/cloud/vision'
require 'google/cloud/storage'

class PhotosController < ApplicationController

  def index
    count= params[:page]
    photos = Photo.page(count).per(12)
    render json: photos
  end

  def show
    photo = Photo.find(params[:id])
    render json: photo
  end

  def search
    photos= []
    allPhotos = Photo.all
    allPhotos.map do |photo|
      photo.tags.each do |tag|
        if tag.tag.include? (params[:term])
          photos.push(tag.photo)
        end
      end
    end
    photos = photos.uniq
    render json: photos
  end

def create
  project_id = 'lunar-marker-182415'
  vision = Google::Cloud::Vision.new
  gcloud = Google::Cloud.new project_id, 'service-account.json'
  storage = gcloud.storage
  base64=params[:image].split(',')[1]
  photo = Photo.new
  photo.caption=params[:caption]
  photo.public=params[:public]
  user = User.find(decoded_token[0]['user_id'])
  photo.user = user
  bucket = storage.bucket "flatiron-final-project"
  photo.save
  data= Base64.decode64(base64)
  output_file = Tempfile.new(['image','.jpeg'])
  output_file.binmode
  output_file.puts data
  new_photo = bucket.create_file(output_file, "photos/#{photo.id}")
  photo.url = new_photo.media_url
  image = vision.image("gs://flatiron-final-project/photos/#{photo.id}")
  photo.save
  annotation = vision.annotate(image, labels: true)
  tag1 = Tag.create(tag: annotation.labels[0].description.split(' ').join('-'), photo_id: photo.id)
  tag2 = Tag.create(tag: annotation.labels[1].description.split(' ').join('-'), photo_id: photo.id)
  tag3 = Tag.create(tag: annotation.labels[2].description.split(' ').join('-'), photo_id: photo.id)
  render json: photo
end


private


def photo_params
  params.permit(:user_id, :url, :filter)
end

end
