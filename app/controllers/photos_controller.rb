require 'rest-client'
require 'google/cloud/vision'
require 'google/cloud/storage'

class PhotosController < ApplicationController

  def index
    photos = Photo.all
    render json: photos
  end

def create
  # key_file= '/Users/Brigit/Documents/Flatiron Final Project-10785a8cd05e.json'
  project_id = 'lunar-marker-182415'
  vision = Google::Cloud::Vision.new
  gcloud = Google::Cloud.new project_id, 'service-account.json'
  storage = gcloud.storage
  base64=params[:image].split(',')[1]
  photo = Photo.new
  photo.caption=params[:caption]
  user = User.find(1)
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
