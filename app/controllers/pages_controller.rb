class PagesController < AppController

    get '/pages' do
        erb :'pages/index'
    end

    get '/pages/:id' do
        @page = Page.find(params[:id])
        if !logged_in?
            redirect '/login'
        elsif !current_user.pages.include?(@page)
            redirect "/pages/#{params[:]}/join"
        end
        erb :'/pages/show_page'
    end

    get '/pages/:id/join' do
        if !logged_in?
            redirect '/login'
        elsif current_user.pages.include?(@page)
            redirect "/pages/#{params[:]}"
        end
        @page = Page.find(params[:id])
        erb :'/pages/join'
    end

    post '/pages/:id' do
        UserPage.create(user_id: current_user.id, page_id: params[:id])
        redirect "/pages/#{params[:id]}"
    end
        

    get '/pages/new' do
        if !logged_in?
            redirect '/login'
        end
        erb :'pages/new'
    end

    post '/pages' do
        page = Page.new(params, user_id: current_user.id)
        if page.save
            redirect "/pages/#{page.id}"
        end
        redirect '/pages/new'
    end

    get '/pages/:id/edit' do
        if !logged_in?
            redirect '/login'
        elsif !UserPage.find_by(page_id: params[:id].id, user_id: current_user.id).mod
            redirect "/pages/#{params[:id]}"
        end
        @page = Page.find(params[:id])
        erb :'/pages/edit'
    end

    patch '/pages/:id' do
        page = Page.find(params[:id])
        if params[:about] == ""
            redirect "/pages/#{params[:id]}"
        end
        page.update(about: params[:about])
    end

    delete '/pages/:id' do
        page = Page.find(params[:id])
        if current_user.admin
            page.delete
        end
        redirect '/pages'
    end

end