json.array!(@wayakus) do |wayaku|
  json.extract! wayaku, :id, :post_id, :post_type, :selected_category, :questionBody, :answer_of_user
  json.url wayaku_url(wayaku, format: :json)
end
