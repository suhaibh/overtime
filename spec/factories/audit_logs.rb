FactoryGirl.define do
  factory :audit_log do
    status 0
    start_date (Date.today - 6.days)
    end_date nil
    user
  end
end
