json.array! @articles do |article|
  json.title article.title
  json.id article.id
  json.body article.body
  json.userName article.user.name
end