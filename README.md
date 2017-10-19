# sampleBlog

Cocoa pods  install

top、creat、Dtail

Viewをストーリーボードで作成
customClassのClassをTopviewvontroller

ニナビゲ０しょんをつけたい
クリックして、
Editor
emba、nnabigation、

「sample Blog」タイトル

barbtn
投稿
Tint color
黒

viewナヴィゲ０しょん


Control でつなげる
modalを選択

NavigationControrreleに紐づいているものクラスめいCreateViewControllerを記述

「Blogを作成する」」

＊ナビげ０しょんの戻るボタンを作成したい

戻るをコードでかく

marumaruを
右
Action
tappedBackbtn

Dissmiss
True
nil

モーダルが出てきてdissmiで戻る
閉じる

＊
ラベル
左１５、ナビに対して１５、高さ２０
constrainmarginのチェックを消してから、赤線消す

＊テキストフィールド
左１５、上はブログタイトルに対して１５、右も15、高さ３０
下はとりあえずいい
▼でブログタイトルに対して
Add

*ブログの内容を書く
＊テキストビュー
TextViewで検索DD
Backgroudcolorがホワイトで醜いから色変える、
左15、 
heigh200
~~~

投稿する
button検索DD
上３０、左右１５、高さ４０

FontをBolodにする


ーーー
TopViewCOntroller
tableViewを検索 でぃーでぃー、
constraintsを
▼Viewで、 隙間なくしたい０設定



New file 
UITableViewCell
classをBlogListCellにする
 alsocreateXIBFILEをクリック
ボードでデザインしましょう
カスタムしてセルを作る場合はチェック

デフォルトで44なので変えたい、
88にする
Xibファイルをクリック、サイドバー物差し、viewのはいとを88ni

＊ブログ投稿した際の時間、とブログ投稿した際のタイトルを表示させたい
そのラベル
LabelをッD
時間
15、上15、高さ20、チェック外す
タイトル
15、上15、高さ20、チェック外す

＊紐付ける
ボードクリック
、丸々で
日時ラベルを右で紐付け、dateLabel名前
インスタンス変数

titleLabelも同様に紐付け
閉じる
もし、同じコードが出なければ何度もばつを押して出るまで

＊sampleBlog(Top)
delegateを設定しないと使えないデータソースがある
コードだとtableview.delegate.selfみたいなものだが、ストーリボードは
クリックして、
controlで黄色いボタンdatasousr
controlで黄色いボタンdelegate
チェック

黄色を押して丸々
tableviewをインスタンス
Control右 tabelView
Table

        tableView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)

        tableView.register(UINib(nibName: "BlogListCell", bundle: nil), forCellReuseIdentifier: "BlogListCell")

カスタムセル画使えないじょうたいなので、registerで使えるように
xliファイルで作ったものをregister登録して使えるようにした

==--
もし、Xibファイルを使わずにカスタムセルを使いたいなとなったときは
tableView.register(BlogListCell.self, forCellReuseIdentifier: "BlogListCell”)
を記述する。
Uinibのところが変わるよ
====

＊Tableビューのdelegateやdatasourseを触る

TopViewcontrller
class TopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

をかく。
func
tableviewを作成するための最低限のメソッド

えらーが消える
Return1
return2

cdllforRowatどういうせるを表示させるか
 let cell = tableView.dequeueReusableCell(withIdentifier: "BlogListCell", for: indexPath)
を記述。

登録したブログリストセルを使うためにttなじidentifiにする、これで表示できるtableview


キャストas! BlogListCell

をしないと UITアbェviewsekというデフォルトと認識される、オリジナルのものなのでキャスト、せるをBloglistcellとしてヒョジさせるよというもの

        cell.dateLabel.text = "10月18日"

        cell.titleLabel.text = "テスト"

        return cell





自動的に高さが反映しないので、

func

セルの高さいくらにするかを定義、88にしたいので、return88





    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }


＝＝＝

Relmを使ってデータを出す
クルードという概念が大切
CRUD
Create
Read
Update
Daleth

どのAPI
URLのたたき方に種類がある
Httpプロトコルにもメソッドというがいねんがある、
 Get：read 
 post：create
Put：更新 update
Delete
HTTPプロトコルにもメソッドがありほとんどモバイルで
データを作る際はCreate、削除はプログラム内でAPIを叩いてさくjょ、
この辺をrelmだとローカル内で完結する。リモートではなく。

クリエイトとread
投稿:create

relmを使うためにどういうオブジェクトを使うかということを定義する、ブログモデルを作ってレルムが用意したものに入れ込む
今回はblogオブジェクトをデータとして保存する

サブクラスObject
クラスBlogRealm

import RealmSwift

でObjectを認識してもらう



カラムみたいなものをインスタンス変数で定義してあげる。

dynamic var title: String?

    dynamic var content: String?

    dynamic var createdAt: Date?



レルムの時はdynamicをつける

レルムを使うためのテーブル



Blogを作成する

cotr右

    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var contentTextView: UITextView!



ブログを投稿するも紐付け

Actionにチェク

       @IBAction func tappedCreateBlogBtn(_ sender: Any) {


ブログれrむのインスタンスを作ってあげる、このインスタンス変数がカラム名のdyanamic〜、titletexttextの値
ブログコンテンと、カラムに追加したいものはkonntenntotekisutobyu-notekisu
、 
をblog.contentに入れる

Date()をかくと現在時刻が欠けるのでcreatedATに入れてあげる

Let realmでレルムのデータに保存するというコードttry! ~~~~
import RealmSwiftを描いてあげる、

ブログを

===

Realm Browserを入手

realmを探す

大変

https://gist.github.com/gologo13/b9971f2a47150733a937






