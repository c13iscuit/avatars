require 'rails_helper'

describe User do
  it { should have_many(:images) }

  it { should have_valid(:username).when("superman_test", "roflcopterbbq") }
  it { should_not have_valid(:username).when(nil, "") }

  it { should_not have_valid(:avatar).when(nil, "") }
end
