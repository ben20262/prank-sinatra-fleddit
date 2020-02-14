class PagesController < AppController

    get '/pages' do
        if !logged_in?
            redirect '/'
        end
        erb :'/pages/show_all'
    end

    get '/pages/new' do
        if !logged_in?
            redirect '/'
        end
        erb :'pages/new'
    end

    post '/pages' do
        page = Page.new(params)
        if page.save
            UserPage.create(page_id: page.id, user_id: current_user.id, mod: 1)
            redirect "/pages/#{page.id}"
        end
        redirect '/pages/new'
    end

    get '/pages/:id' do
        @page = Page.find(params[:id])
        if !logged_in?
            redirect '/'
        elsif !current_user.pages.include?(@page) && !current_user.admin
            redirect "/pages/#{params[:id]}/join"
        end
        erb :'/pages/show_page'
    end

    get '/pages/:id/join' do
        @page = Page.find(params[:id])
        if !logged_in?
            redirect '/'
        elsif current_user.pages.include?(@page) && !current_user.admin
            redirect "/pages/#{params[:id]}"
        end
        @page = Page.find(params[:id])
        erb :'/pages/join'
    end

    get '/pages/:id/leave' do
        @page = Page.find(params[:id])
        if !logged_in?
            redirect '/'
        elsif !current_user.pages.include?(@page) && !current_user.admin
            redirect '/users'
        end
        erb :'pages/leave'
    end

    post '/pages/:id' do
        UserPage.create(user_id: current_user.id, page_id: params[:id])
        redirect "/pages/#{params[:id]}"
    end

    post '/pages/:id/leave' do
        page = Page.find(params[:id])
        current_user.pages.delete(page)
        redirect '/users'
    end

    get '/pages/:id/edit' do
        if !logged_in?
            redirect '/'
        elsif !UserPage.find_by(page_id: params[:id], user_id: current_user.id).mod && !current_user.admin
            redirect "/pages/#{params[:id]}"
        end
        @page = Page.find(params[:id])
        erb :'/pages/edit'
    end

    get '/pages/:id/delete' do
        if !logged_in?
            redirect '/'
        elsif !UserPage.find_by(page_id: params[:id], user_id: current_user.id).mod && !current_user.admin
            redirect "/pages/#{params[:id]}"
        end
        @page = Page.find(params[:id])
        erb :'pages/delete'
    end

    patch '/pages/:id' do
        page = Page.find(params[:id])
        if params[:about] == ""
            redirect "/pages/#{params[:id]}"
        end
        page.update(about: params[:about])
        redirect "/pages/#{params[:id]}"
    end

    delete '/pages/:id' do
        page = Page.find(params[:id])
        redirect '/users'
    end

end