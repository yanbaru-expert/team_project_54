# texts, movies テーブルを再生成（関連付くテーブルを含む）
%w[texts movies].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} RESTART IDENTITY CASCADE")
end

require "csv"

CSV.foreach("db/csv_data/text_data.csv", headers: true) do |row|
  Text.create!(row.to_h)
end

CSV.foreach("db/csv_data/movie_data.csv", headers: true) do |row|
  Movie.create!(row.to_h)
end

email = "test@example.com"
password = "password"

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: email) do |user|
  user.password = password
  puts "ユーザーの初期データインポートに成功しました。"
end

admin_email = "admin@example.com"

# テストadminユーザーが存在しないときだけ作成
AdminUser.find_or_create_by!(email: admin_email) do |admin|
  admin.password = "password"
  puts "adminユーザーの初期データインポートに成功しました。"
end
