# In My Blood
好きな動画のYoutubeリンクを投稿して、自己紹介をしよう
[![Image from Gyazo](https://i.gyazo.com/b38048e89ae16c34ca5b0c782aacf682.jpg)](https://gyazo.com/b38048e89ae16c34ca5b0c782aacf682)

# 課題発見と解決
視聴していた生配信の同時視聴者数や訪れた音楽配信の総視聴回数が、年々増えてきたことにより、youtubeの利用者数の増加を肌感覚で感じていた。また、感染病対策としての自粛や自宅待機要請によって、国内月間利用ユーザーが6000万も超えているとの記事も出ている。<br>
記事のソース[<a href="https://www.thinkwithgoogle.com/intl/ja-jp/marketing-strategies/video/youtube-recap2020-2/">月間 6,500 万ユーザーを超えた YouTube、2020 年の国内利用実態──テレビでの利用も 2 倍に</a>]<br>
このことから、国内でも相当の数の人がyoutubeを利用し、その見ている動画が人柄に及ぼす影響は小さくないと自分は考えた。<br>
その一方で、twitterではツイフィールや画像などで自己紹介はするが、youtubeリンクで自己紹介する人は滅多にいない。再生リスト機能で共有することも可能なはずだが、使っているのは宣伝目的の企業や団体くらいである。
何が障害になっているのだろうか。
## ３つの問題
 - 問題①サムネが小さい(文字が大きい)
 - 問題②縦で見辛い
 - 問題③匿名性が担保しづらい
[![Image from Gyazo](https://i.gyazo.com/5cad662e98802f746bba2ebfc3644d2e.png)](https://gyazo.com/5cad662e98802f746bba2ebfc3644d2e)


画像はyoutubeの再生リストのものだ。サムネイル(動画の表題画像)が小さく、文字が大きいことがわかるだろう。現代のyoutubeネイティブはこのような画面はあまり好まないと考えた。なぜならば、普段大きなサムネイルで視線誘導され、タイトル文を見るという慣習から逆行しているからだ。また縦配置なのもマイナスである。実際によく使ってるyoutubeはサムネイル＋タイトルのブロックで横に４つ、それが縦に展開され並列に並んでいるが、再生リストでは縦のみである。そういった慣れ親しんだUIとの乖離が見辛さを作り出してるのではないかと考えた。<br>

また、youtubeアカウントが表示されてしまうため、問題③が発生する。これは小さな心理的障害である。ブランドアカウント(<a href="https://support.google.com/youtube/answer/2897336?hl=ja">*</a>)や非公開設定でブロックができるものの、あまり自分の視聴用チャンネルを貼りたいと思う人は少ないのではないかと考えた。

## 解決策
### iframeでサムネを大きく、並列でメディアに慣れている若者に向けたポートフォーリオサイトに!
[![Image from Gyazo](https://i.gyazo.com/fe9b7df8d422141188fa13dcb6feae2a.jpg)](https://gyazo.com/fe9b7df8d422141188fa13dcb6feae2a)<br>



タブ詳細で<br>
[![Image from Gyazo](https://i.gyazo.com/647ec84a036b33d6aa322d6e112ca727.gif)](https://gyazo.com/647ec84a036b33d6aa322d6e112ca727)
<br>

# 機能一覧
- ユーザー管理機能
- タグ＆url保存機能
- iframeタグ一覧表示機能
# デプロイurl
https://in-my-blood.herokuapp.com/users/4/tags
*法的観点からurl投稿機能に一部制限をかけています
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

- has_many :tags

## tags テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| tag_name   | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

- belongs_to :user
- has_many :urls

## urls テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| youtubepath | string     | null: false                    |
| tag         | references | null: false, foreign_key: true |

- belongs_to :tag
