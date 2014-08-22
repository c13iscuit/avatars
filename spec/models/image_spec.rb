require 'rails_helper'

describe Image do
  it { should belong_to(:user) }

  it { should have_valid(:url).when(
      "http://psbehrend.psu.edu/sites/default/files/images/Nye%20Bill-%20Photo%20(High%20Res%20HEADSHOT%202005).jpg",
      "http://img2.timeinc.net/people/i/2009/database/091123/neil-patrick-harris-300.jpg"
      ) }
  it { should_not have_valid(:url).when(nil, "") }
end
