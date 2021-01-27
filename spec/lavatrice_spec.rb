require '.lib/sandpaper'

author.role = 'Pro'

def event.author.role?('Pro') do
  it "returns true iff author role is pro" do
    b = event.author.role?('Pro')
    expect(b == true)
  end
end
