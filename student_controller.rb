require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( './models/student')

get '/student' do
  @students = Student.all()
  erb(:index)
end
