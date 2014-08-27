require 'rails_helper'

describe User do
  it { should have_many(:images) }

  it { should have_valid(:username).when("superman_test", "roflcopterbbq") }
  it { should_not have_valid(:username).when(nil, "") }

  it { should have_valid(:avatar).when("http://psbehrend.psu.edu/sites/default/files/images/Nye%20Bill-%20Photo%20.jpg",
      "http://img2.timeinc.net/people/i/2009/database/091123/neil-patrick-harris-300.jpg") }
  it { should_not have_valid(:avatar).when(nil, "") }
end
