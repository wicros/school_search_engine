namespace :comments do
  desc 'create'
  task create: :environment do
    config = ENV.fetch('CONFIG') {'google_drive_config.json'}
    id = ENV.fetch('ID') {'1SRDYu8JFDGhyVrK2zLy0VhOgSZU28qL--V9CvO0sKQc'}
    gid = ENV.fetch('GID') {'1828052641'}

    require "google_drive"
    session = GoogleDrive::Session.from_config(config)
    worksheet = session.spreadsheet_by_key(id).worksheet_by_gid(gid)
    column_indices = {}

    worksheet.rows.each.with_index do |row, i|

      if i == 0
        column_indices[:school_id] = row.index('school_id')
        column_indices[:location_score] = row.index('location_score')
        column_indices[:environment_score] = row.index('environment_score')
        column_indices[:service_score] = row.index('service_score')
        column_indices[:progression_score] = row.index('progression_score')
        column_indices[:teaching_score] = row.index('teaching_score')
        column_indices[:fee_score] = row.index('fee_score')
        column_indices[:content] = row.index('content')
        next
      end

      attrs = column_indices.map {|k, v| [k, row[v.to_i]]}.to_h
      next if attrs[:school_id].blank?
      Comment.find_or_create_by!(attrs)
    end
  end
end