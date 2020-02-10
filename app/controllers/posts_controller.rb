class PostsController < AppController

    get '/posts/:id' do
        if !logged_in?
            redirect '/login'
        end
        post = Post.find(params[:id])
        erb :'posts/show'
    end

    get '/pages/:page_id/posts/new' do
        if !logged_in?
            redirect '/login'
        elsif !UserPage.find(current_user.id)
        end
        @page = Page.find(params[:id])
        erb :'posts/new'
    end

    post '/pages/:page_id/posts' do

    end

    get '/pages/:page_id/posts/:post_id/edit' do
        @page = Page.find(params[:page_id])
        @post = Post.find(params[:post_id])
        if !logged_in?
            redirect '/login'
        elsif @post.user_id != current_user.id
            redirect "/pages/#{params[:page_id]}"
        end
        erb :'posts/edit'
    end

    patch '/pages/:page_id/posts/:post_id' do
        
    end

    delete '/pages/:page_id/posts/:post_id' do

    end
end