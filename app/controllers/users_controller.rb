class UserController < AppController

    get '/' do
        if logged_in?
            redirect '/users/pages'
        end
        erb :index
    end

    get '/signup' do
        if logged_in?
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
        if logged_in?
            redirect "/users/#{current_user.id}"
        end
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/users/pages'
        end
        redirect '/signup'
    end

    get '/logout' do
        if logged_in?
            session.delete(:user_id)
        end
        redirect '/'
    end

    get '/users/pages' do
        erb :'/users/user_pages'
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'/users/index'
    end

    
end