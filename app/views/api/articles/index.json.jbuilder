json.array! @articles do |article|
  json.title article.title
  json.body article.body
  json.userName article.user.name
end