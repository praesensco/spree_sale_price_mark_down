namespace :spree do
  namespace :mark_down do
    desc "Refresh sale prices defined by Mark Downs"
    task apply_all: :environment do
      puts 'Disabled'
      # Spree::MarkDown.each(&:apply)
    end
  end
end
