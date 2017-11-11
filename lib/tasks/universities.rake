namespace :universities do
  desc 'create'
  task create: :environment do
    CollegeSandbox.select('name').group(:name).each do |item|
      UniversityName.find_or_create_by!(name: item.name).save
    end

    CollegeSandbox.select('department').group(:department).each do |item|
      p item.department.to_s
      UniversityDepartment.find_or_create_by!(name: item.department).save
    end

    CollegeScore.select('name').group(:name).each do |item|
      UniversityName.find_or_create_by!(name: item.name).save
    end

    CollegeScore.select('department').group(:department).each do |item|
      UniversityDepartment.find_or_create_by!(name: item.department).save
    end

    CollegeScore.all.each do |item|
      de = UniversityDepartment.find_by(name: item.department)
      na = UniversityName.find_by(name: item.name)
      un = UniversityScore.find_or_create_by(university_id: na.id,department_id: de.id)

      un.name = item.name
      un.department = item.department
      un.average = item.average
      un.median = item.median
      un.highest = item.highest
      un.lowest = item.lowest
      un.sample_size = item.sample_size
      un.university_id = na.id
      un.department_id = de.id
      un.save
    end

    CollegeSandbox.all.each do |item|
      de = UniversityDepartment.find_by(name: item.department)
      na = UniversityName.find_by(name: item.name)
      un = UniversityScore.find_or_create_by(university_id: na.id,department_id: de.id)
      pr = Prefecture.where("name like ?",item.prefecture_name+"%").take

      un.name = item.name
      un.department = item.department
      un.total_name = item.total_name
      un.prefecture_name = item.prefecture_name
      un.heat = item.heat
      un.difficulty = item.difficulty
      un.acceptance_rate = item.acceptance_rate
      un.university_id = na.id
      un.department_id = de.id
      un.prefecture_id = pr.id if pr.present?
      un.save
    end
  end
end