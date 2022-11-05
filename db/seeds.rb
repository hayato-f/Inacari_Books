

Category.create([
    { name: '総記' },{ name: '哲学' },{ name: '歴史' },{ name: '社会科学' },{ name: '自然科学' },
    { name: '技術' },{ name: '産業' },{ name: '芸術' },{ name: '言語' },{ name: '文学' },
    { name: 'スポーツ' },{ name: '料理' },{ name: '旅行' },{ name: 'ビジネス書' },{ name: '小説、エッセイ' },
    { name: '漫画、コミック' },{ name: '辞書' },{ name: '趣味、実用' },{ name: '専門書' },{ name: '参考書' },
    { name: '絵本、児童書' },{ name: '雑誌' },{ name: '動物、植物' },{ name: '楽譜' },{ name: 'その他' }
])

User.create!(
    name: "test",
    account_name: "test",
    email: "test@email.com",
    password_digest: "testpass",
    tel: "00045678901",
    shipping_address: "東京都１番地"
)

10.times do |n|
    name = Faker::Name.name
    account_name = Faker::FunnyName.name
    email = Faker::Internet.email
    password = "password" + "#{n}"
    tel = "#{n}" * 11
    shipping_address = Faker::Address.city
    User.create!(
        name: name,
        account_name: account_name,
        email: email,
        password_digest: password,
        tel: tel,
        shipping_address: shipping_address

    )

    title = Faker::Book.title
    Book.create!(
        seller_id: 1,
        title: title,
        product_condition: "新品",
        price: n,
        postage: 500,
        published: true
    )
end