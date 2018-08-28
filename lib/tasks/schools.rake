namespace :schools do
  desc 'change img url'
  task change_img_url: :environment do
    ApplicationRecord.transaction do
      School.all.each do |school|
        school.update!(img_url_file_name: "https://s3-ap-northeast-1.amazonaws.com/linc-search/school/#{school.img_url.to_s.gsub!("/system/schools/img_urls/000/000/","")}")
      end
    end
  end
end



# ShXLzlN0_400x400.jpg:1 GET https://s3-ap-northeast-1.amazonaws.com/linc-search/school/125/original/ShXLzlN0_400x400.jpg?1521872991 403 (Forbidden)
#
#
# https://s3-ap-northeast-1.amazonaws.com/linc-search/school/002/original/timg.jpeg