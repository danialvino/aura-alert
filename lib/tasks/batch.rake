namespace :batch do
  desc "Check aura availability"
  task check_alert: :environment do
    AlertService.new.call
  end

end
