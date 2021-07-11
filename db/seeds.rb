# texts, movies テーブルを再生成（関連付くテーブルを含む）
%w[texts movies].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name} RESTART IDENTITY CASCADE")
end

require "csv"

CSV.foreach("db/csv_data/text_data.csv", headers: true) do |row|
  Text.cretate(
    genre: row["genre"],
    title: row["title"],
    content: row["content"]
  )
end

CSV.foreach("db/csv_data/movie_data.csv", headers: true) do |row|
  Movie.create(
    genre: row["genre"],
    title: row["title"],
    url: row["url"]
  )
end

email = "test@example.com"
password = "password"

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: email) do |user|
  user.password = password
  puts "ユーザーの初期データインポートに成功しました。"
end
