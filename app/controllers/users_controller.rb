class UserController < AppController

    get '/' do
        if logged_in? && current_user.id > User.all.size
            redirect '/logout'
        elsif logged_in?
            redirect '/users'
        end
        erb :index
    end

    get '/signup' do
        if logged_in? && current_user.id > User.all.size
            redirect '/logout'
        elsif logged_in?
            redirect "/users/#{current_user.id}"
        end
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect "/users/#{current_user.id}"
        end
        redirect '/signup'
    end

    get '/login' do
        if logged_in? && current_user.id > User.all.size
            redirect '/logout'
        elsif logged_in?
            redirect "/users"
        end
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/users'
        end
        redirect '/signup'
    end

    get '/logout' do
        if logged_in?
            session.delete(:user_id)
        end
        redirect '/'
    end

    get '/users' do
        if logged_in? && current_user.id > User.all.size
            redirect '/logout'
        elsif !logged_in?
            redirect '/'
        end
        erb :'/users/user_pages'
    end

    get '/users/:id' do
        if params[:id].to_i > User.all.size
            redirect '/users'
        elsif !logged_in?
            redirect '/'
        end
        @user = User.find(params[:id])
        erb :'/users/index'
    end

    
end