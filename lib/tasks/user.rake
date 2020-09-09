namespace :user do
  desc "Enriching all users with Clearbit (async)"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enqueuing update of #{user.email}..."
    users.each do |user|
      UpdateUserJob.perform_later(user)
    end
    # rake task will return when all jobs are _enqueued_ (not done).
  end

end
