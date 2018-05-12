require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#header' do
    let(:title) { 'test' }
    subject! { helper.header(title) }

    it 'sets the content for :header' do
      expect(helper.content_for(:header)).to eq(
        "<div class=\"row wrapper border-bottom white-bg page-heading\">\n"\
        "  <div class=\"col-lg-12\">\n"\
        "    <h2>#{title}</h2>\n    \n"\
        "  </div>\n"\
        "</div>\n"
      )
    end
  end
end
