crumb :root do
  link "トップページ", root_path
end

crumb :items_new do
  link "出品画面", new_item_path
  parent :root
end

crumb :items_show do |item|
  link item.name + "詳細", item_path(item)
  parent :root
end

crumb :items_edit do |item|
  link item.name + "編集画面", edit_item_path(item)
  parent :items_show, item
end

crumb :orders_new do |item|
  link item.name + "購入画面", new_item_order_path(item)
  parent :items_show, item
end

crumb :new_user_registration do
  link "ユーザー登録", new_user_registration_path
  parent :root
end

crumb :new_user_session do
  link "ログイン", new_user_session_path
  parent :root
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).