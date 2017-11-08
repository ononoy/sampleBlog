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

https://gist.github.com/gologo13/b9971f2a47150733a937

-----
タップして繊維
ToPViewCTR
セルをセレクトしたというメソッドをかく
indexPathは、テーブルビュー、インデックスパスのセクション、何番目のセクションか、index.pathセクション0番目１番目、rowの場合はセクションに対して何番目のセルカ。0.1.2という数字
セクション１番目、row２番目（せる１つづつにデータを持たしている、渡している、次出そうと思っているものに、１個１こ格納している、タップした時にindexPathのrowとかsectionを使う

テーブルビューをセットして、レルムのデータを引っ張ってくる、getrealmData、オブジェクトを作って配列で打ち込む、
データソースを定義して、データを作って、インスタンス取得しつつ、

dtableViewのカウントnumberofrows、rowに関してはnilじゃなかったとき、cellをおいてください、だったらrowの0、

データソースを持たせる、１個１個のレルムブログデータを管理するためのプロパティ、
    var dataSource: [BlogRealm]!

次にgetRealmData

レルムからデータを持ってきて突っ込むための配列、最終的に追加されたものがデータソースにぶち込みにしたい

lertryRealm!はインスタンス化するとレルムデータを持ってこれるから使う、

Var I = 0 はwhile文を使うとき、抜けるタイミングをiで制御したい、対象のカウントよりも出れるようにしたいのでi = 0

なんのカウントか（レルムの書き方、real.objects(BlogRealmDataを引っ張ってくる、

var sortedBlogDataはすべてのレルムデータを入れるための変数を定義してあげて、その箱にcreatedAtで定義されたものが入り込む。

let BlogRealm

I番目のcontentをブログのコンテントに入れて、中身の詰まったものをぶち込む、while文、BぉgDarray、

最終的に、tableView.realoadDataで更新してくれる。

先ほどはデータベースが空だったが、ある状態でリロードするので、カウント文をrowで返して、

dataSource[indexPatn]はBlogRealm 、

dataSource = [BlogRealm　BlogRealm]

データソースの中にblogrealmが2つ、

データソースに入っているindexPath.rowの0番目の.titleが現れる、

------

ブログのディテール、didSelect

タップしたときにブログに入れてあげて、遷移先に使いたい値を渡したいので



繊維DEtailVCとnavigationCTR

タップした瞬間のdataSource[indezPath.row]

    //遷移するコード
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let blogDetailVC = DetailViewController()
        blogDetailVC.blog = dataSource[indexPath.row]
        navigationController?.pushViewController(blogDetailVC, animated: true)


持たせることによって、ブログのデータ使える値受け渡し
箱

値の受け渡しができているかどうか、ラベルを置いて、ブログタイトル

—
編集
ボタンを追加したい

viewControrrleにnavigationvarbTBアイテム
バーボタンアイテム

        //編集ボタン
        let naviBarBtn = UIBarButtonItem(title: "編集", style: UIBarButtonItemStyle.plain, target: self, action: #selector(goEditPage))
        navigationItem.rightBarButtonItem = naviBarBtn
        
    }
    
    func goEditPage() {
        
    }


飛んだら編集モードに切り替える

goEditPageに

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let createBlogViewcontroller = storyboard.instantiateViewController(withIdentifier: "CreateViewController") as! CreateViewController
        navigationController?.pushViewController(createBlogViewcontroller, animated: true)
を入れる、 関連付け、StoryboadIDとクラスを指定して関連付け

戻るはモーダルで上がった時しか定義していない、

ブログを作成するCTRがEdit経由のビューコンかTOP経由なのかを判定する必要がある。bool値

detailなのか違うのかvar osFromDetailVC = false 

TOPビューコントローラーが基本という前提でfalse

Blog?、?を書くことによって、新規作成の際ではなく、

繊維のタイミングでviewCTRが作られ、blog=



編集ボタンを押した時の処理

    func goEditPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let createBlogViewcontroller = storyboard.instantiateViewController(withIdentifier: "CreateViewController") as! CreateViewController
        createBlogViewcontroller.isFromDetailVC = true
        createBlogViewcontroller.blog = self.blog
        navigationController?.pushViewController(createBlogViewcontroller, animated: true)
        
        

ディテールからきたCTR、ブログ編集画面を渡す


—

tappedBtん

Push繊維の戻るを考慮したい

    //戻るボタン
    @IBAction func tappedBackBtn(_ sender: Any) {
        // if isFromDetailVC == true と同じ意味
        if isFromDetailVC {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }


--最後に編集
ボタンをタップした時に投稿するのか編集するのか、
tappedCreateBlogBtnを作っているのでそこで条件分岐する

空の場合だったら、編集でも投稿でもいいが、
isFromDetailVCは編集処理、
Topからの繊維であれば新規投稿
         navigationController?.popToRootViewController(animated: true)


はPUSH遷移の戻り方、一番最初の遷移元に戻る


古いデータソースが残ったままで更新されるが一回落とさないといけない、更新したら新しいデータベースを取得するようにする

NSnodifcationOfserver
TOPViewCTRで編集したを通知して、新たにRealmデータを引っ張る、
最初に通知の登録、createviewの方でUPしたら通知を送る、

    //ここで登録した通知が来たら処理を行う

    func afterUpdate() {

        //通知登録
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(afterUpdate),
                                               name: NSNotification.Name(rawValue: "afterUpdate"),
                                               object: nil)


CreateViewControllerに戻って、
isFromDetailVC {} updateされたら通知させる処理

            //topViewControllerで登録しておいた通知を発生させる

            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "afterUpdate"), object: nil)



離れている時オブジェクト間の値受け渡しの通知で
notificationofserverのティフィケーションオブザーバー

条件分岐、realmデータを保持して走らせる、セル１つ１つにrowsection配列の南蛮めをうまくして受け渡し、データを
ーーーー
Deretateデリート






