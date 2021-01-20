# アプリ名
 # 保護ネコ<font color="Yellow">✖︎</font>クラウドファンディング
  [![Image from Gyazo](https://i.gyazo.com/31208c02f54f25be385e7676954909eb.jpg)](https://gyazo.com/31208c02f54f25be385e7676954909eb)

# 概要
  ネコの保護活動を行っている団体または個人がその活動費用をクラウドファンディングを通して募るサイトです。

# 本番環境
  ## http://54.65.65.196/

  ログイン情報(テスト用)
  - Eメールアドレス：pom@gmail.com
  - パスワード：1234567

# 制作背景 
 ## きっかけ
  私はネコを10年以上飼っていて、自分にとって家族のような存在です。  
  そのためネコに関するアプリを作ってみたいと思いました。  
  どのようなアプリを作るか考えていた際、コロナの流行によって保護ネコカフェが経営難になっている状況をニュースで知り  
  自分の飼っているネコだけではなく、多くのネコとネコに関わる人たちが幸せになれるアプリを作りたいと思ったのがきっかけです。  
 ## 思考回路 
  STEP1 調べてみるとネコの保護団体は収入はつねに不安定で資金難や人手不足の問題を抱えている。  
  STEP2 そのような中、コロナの影響で保護ネコカフェの経営が厳しく、イベント開催も難しい状況が続いている。  
        また、ネコ自身も感染のリスクがある。  
  STEP3 実際にその場に行かなくても興味を持った人たちが気軽にネコを支援できる場をアプリで作ろう！！  
 ## 夢
  クラウドファンディングの機能だけではなくゆくゆくは  
  譲渡会の情報を乗せたり、アフィリエイトを利用して得た収入をそのまま寄付したりなどして  
  保護ネコプラットフォームになるよう育てていけたら嬉しいと思っています。  
   
  



## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :projects
- has_many :billings
- has_one :address
- has_many :after_reports
- has_one :card

## projectsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|image|text|null: false|
|profile|text|null: false|
|text|text|null: false|
|target_amount|int|null: false|
|tarm|data|null: false|
|return_title_1|string|null: false|
|return_price_1|int|null: false|
|return_title_2|string||
|return_price_2|int||
|return_title_3|string||
|return_price_3|int||
|user_id|refrence|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :billings
- has_many :after_reports

## billingsテーブル
|Column|Type|Options|
|------|----|-------|
|return_1|int||
|return_2|int||
|return_3|int||
|user_id|refrence|null: false, foreign_key: true|
|project_id|refrence|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :project

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|destination_family_name|string|null: false|
|destination_first_name|string|null: false|
|destination_family_name_furigana|string|null: false|
|destination_first_name_furigana|string|null: false|
|postal_code|string|null: false|
|prefectures_area|integer|null: false|default:""|
|municipality|string|null: false|
|house_number|string|null: false|
|house_number|string|
|tel|string|unique: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## after_reportsテーブル
|Column|Type|Options|
|------|----|-------|
|report_title|text|null: false|
|report_image|text|null: false|
|report_date |string|null: false|
|report_text|text|null: false|
|user_id|refrence|null: false, foreign_key: true|
|project_id|refrence|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :project

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|refrence|null: false, foreign_key: true|
|payjp_id|string |null: false|
|customert|string |null: false|
### Association
- belongs_to :user
