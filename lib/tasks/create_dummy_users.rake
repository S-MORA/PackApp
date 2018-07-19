namespace :dummy do

  # run rake dummy:all to populate an entire DB
    task all: [:create_users, :create_dogs, :create_walk_requests ]

    #  run  rake dummy:create_users
    task create_users: :environment do
        10.times do |i|
            password = Faker::Internet.user_name
            User.create(
                email: Faker::Internet.email,
                password: password,
                password_confirmation: password,
                first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                postal_code: Faker::Address.postcode,
                address_line_one: Faker::Address.street_address

            )
        end
    end

        # run rake dummy:create_dogs
        # this will only populate the NAME and ID

    task create_dogs: :environment do
        users= User.all,

        2.times do |i|
            Dog.create(
                name: Faker::Dog.name,
                weight: Faker::Dog.size,
                temperment: "Good Boi",
                breed: Faker::Dog.breed,
                user_id: 71,
                date_of_birth: Faker::Dog.age,
                )
            end
        end
            # run rake dummy:create_walk_requests to populate a table for requests
            # only values are user_id walk_id and dog_id currently.
        task create_walk_requests: :environment do
            users= User.all
            dogs =Dog.all
            10.times do |i|
                WalkRequest.create(
                    user_id: User.all[i].id,
                    walker_id: 71,
                    dog_id: Dog.all[i].id,
                    date: Faker::Date.forward(14),
                    walk_start_time: Faker::Time.forward(23, :morning),

                        )
        end
    end
        #run rake dummy:delete_whatever to drop all data
    task delete_users: :environment do
        User.destroy_all
    end
    task delete_dogs: :environment do
        Dog.destroy_all
    end
    task delete_walk_requests: :environment do
        WalkRequest.destroy_all
    end
end
