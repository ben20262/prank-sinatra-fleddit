class PostsController < AppController

    get '/pages/:page_id/posts/new' do
        if params[:page_id] > Page.all.size
            redirect '/users'
        end
        if current_user.id > User.all.size
            redirect '/logout'
        elsif !logged_in?
            redirect '/'
        elsif !UserPage.find_by(user_id: current_user.id, page_id: params[:page_id].to_i)
            redirect "/pages/#{params[:page_id]}/join"
        end
        @page = Page.find(params[:page_id])
        erb :'posts/new'
    end

    get '/pages/:page_id/posts/:post_id' do
        if params[:page_id] > Page.all.size || params[:post_id] > Post.all.size
            redirect '/users'
        end
        @page = Page.find(params[:page_id])
        @post = Post.find(params[:post_id])
        if current_user.id > User.all.size
            redirect '/logout'
        elsif !logged_in?
            redirect '/'
        elsif !UserPage.find_by(user_id: current_user.id, page_id: params[:page_id].to_i)
            redirect "/pages/#{params[:page_id]}/join"
        end
        post = Post.find(params[:post_id])
        erb :'posts/show'
    end

    post '/pages/:page_id/posts' do
        post = Post.new(title: params[:title], content: params[:content], page_id: params[:page_id], user_id: current_user.id)

        if post.save
            redirect "/pages/#{post.page_id}/posts/#{post.id}"
        end
        redirect "/pages/#{params[:page_id]}/posts/new"
    end

    get '/pages/:page_id/posts/:post_id/edit' do
        if params[:page_id] > Page.all.size || params[:post_id] > Post.all.size
            redirect '/users'
        end
        @page = Page.find(params[:page_id])
        @post = Post.find(params[:post_id])
        if current_user.id > User.all.size
            redirect '/logout'
        elsif !logged_in?
            redirect '/'
        elsif @post.user_id != current_user.id
            redirect "/pages/#{params[:page_id]}"
        end
        erb :'posts/edit'
    end

    get '/pages/:page_id/posts/:post_id/delete' do
        if params[:page_id] > Page.all.size || params[:post_id] > Post.all.size
            redirect '/users'
        end
        @page = Page.find(params[:page_id])
        @post = Post.find(params[:post_id])
        if current_user.id > User.all.size
            redirect '/logout'
        elsif !logged_in?
            redirect '/'
        elsif @post.user_id != current_user.id && !UserPage.find_by(page_id: @page.id, user_id: current_user.id).mod && !current_user.admin
            redirect "/pages/#{params[:page_id]}/posts/#{params[:post_id]}"
        end
        erb :'posts/delete'
    end

    patch '/pages/:page_id/posts/:post_id' do
        if params[:title].empty? || params[:content].empty?
            redirect "/pages/#{params[:page_id]}/posts/#{params[:post_id]}"
        end
        post = Post.find(params[:post_id])
        post.update(title: params[:title],content: params[:content])
        redirect "/pages/#{params[:page_id]}/posts/#{params[:post_id]}"
    end

    delete '/pages/:page_id/posts/:post_id' do
        post = Post.find(params[:post_id])
        post.delete
        redirect "/pages/#{params[:page_id]}"
    end
end