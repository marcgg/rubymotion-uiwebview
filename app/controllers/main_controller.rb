class MainController < UIViewController

  def initWithNibName(name, bundle: bundle)
    super
    self
  end

  def viewDidLoad
    self.view = UIWebView.alloc.init
    self.view.delegate = self
    self.view.scrollView.scrollEnabled = false
    self.view.scrollView.bounces = false
    path = NSBundle.mainBundle.pathForResource('index', ofType: 'html')
    url = NSURL.fileURLWithPath(path)
    self.view.loadRequest NSURLRequest.requestWithURL(url)
  end

  def webView(inWeb, shouldStartLoadWithRequest: inRequest, navigationType: inType)
    if inRequest.URL.absoluteString =~ /myapp:\/\//
      puts "Do something!"
    else
      puts "This is just another link"
    end
    true
  end

end

