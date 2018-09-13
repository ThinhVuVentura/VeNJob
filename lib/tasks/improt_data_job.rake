desc 'import data'
task import_data: :environment do
  # ... set options if any
  DataJob::ImportData.new().import_job
end