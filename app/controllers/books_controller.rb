class BooksController < ApplicationController

  def top
  end

  def index
    #一覧表示機能。ここで設定するからindexアクションはいらない。
    @books = Book.all

    #投稿機能
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # ３. トップ画面へリダイレクト
    # redirect_to '/books'

    # 詳細画面へリダイレクト
    # redirect_to booksid_path(book.id)

    # 詳細画面へリダイレクトしたときに、成功しましたと言うメッセージを表示させる。
    # https://pikawaka.com/rails/flash
    if @book.save
      flash[:notice] = "Book was successfully apple created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    if @book.destroy
      flash[:notice] ="Book was successfully destroyed."
      redirect_to "/books"  # 投稿一覧画面へリダイレクト
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
