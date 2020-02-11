class PostsController < AppController

    get '/pages/:page_id/posts/new' do
        if !logged_in?
            redirect '/login'
        elsif !UserPage.find_by(user_id: current_user.id, page_id: params[:page_id].to_i)
            redirect "/pages/#{params[:page_id]}/join"
        end
        @page = Page.find(params[:page_id])
        erb :'posts/new'
    end

    get '/pages/:page_id/posts/:post_id' do
        @page = Page.find(params[:page_id])
        @post = Post.find(params[:post_id])
        if !logged_in?
            redirect '/login'
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
        @page = Page.find(params[:page_id])
        @post = Post.find(params[:post_id])
        if !logged_in?
            redirect '/login'
        elsif @post.user_id != current_user.id
            redirect "/pages/#{params[:page_id]}"
        end
        erb :'posts/edit'
    end

    get '/pages/:page_id/posts/:post_id/delete' do
        @page = Page.find(params[:page_id])
        @post = Post.find(params[:post_id])
        if !logged_in?
            redirect '/login'
        elsif @post.user_id != current_user.id || !UserPage.find_by(page_id: @page.id, user_id: current_user.id)
            redirect "/pages/#{params[:page_id]}"
        end
        erb :'posts/delete'
    end

    patch '/pages/:page_id/posts/:post_id' do

    end

    delete '/pages/:page_id/posts/:post_id' do

    end
end