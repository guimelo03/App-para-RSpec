FactoryBot.define do
    factory :customer, aliases: [:user] do 

        transient do
            upcased { false }
        end

        name {"Sr. #{ Faker::Name.name }"}
        email { Faker::Internet.email }

        trait :male do
            gender { 'M' }
        end

        trait :female do
            gender { 'F' }
        end

        trait :vip do
            vip { true }
            days_to_pay { 30 }
        end

        trait :default do
            vip { false }
            days_to_pay { 15 }
        end

        factory :customer_male, traits: [:male] do
        end

        factory :customer_female, traits: [:female] do
        end

        factory :customer_vip, traits: [:vip] do
        end

        factory :customer_default, traits: [:default] do
        end

        factory :customer_male_vip, traits: [:male, :vip] do
        end

        factory :customer_female_vip, traits: [:female, :vip] do
        end

        factory :customer_male_default, traits: [:male, :default] do
        end

        factory :customer_female_default, traits: [:female, :default] do
        end

        after(:create) do |customer, evaluator|
            customer.name.upcase! if evaluator.upcased
        end
    end
end