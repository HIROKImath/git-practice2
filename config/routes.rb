Rails.application.routes.draw do

#まずは、topページからの設定
#ルートディレクトリへのルート設定方法
#参考サイト：https://www.javadrive.jp/rails/routing/index2.html
root :to => 'books#top'

#/booksをGETしたとき
get 'books' => 'books#index'

post 'books' => 'books#create'

get 'books/:id' => 'books#show', as: 'book' # .../books/1 や .../books/3 に該当する

get 'books/:id/edit' => 'books#edit', as: 'edit_book'

patch 'books/:id' => 'books#update', as: 'update_book'

delete 'books/:id' => 'books#destroy', as: 'destroy_book'


#resourcesはnewとかでなく、booksアクションを作るので、邪魔になるだけだから使わない。
#resources:books


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
