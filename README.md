    
   
   ![screen shot 2015-05-28 at 15 55             53](https://cloud.githubusercontent.com/assets/5831653/7860513/87d6a662-0552-11e5-9b82-054e8fcb3dba.png)
   
   
   
    Installation

    Add the CAProgressBar.h and CAProgressBar.m source files to your project.
    Download the latest code version or add the repository as a git submodule to your git-tracked project.
    Open your project in Xcode, then drag and drop CAProgressBar.h and CAProgressBar.h onto your project (use the "Product          Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project.
    Include CAProgressBar wherever you need it with #import "CAProgressBar.h"

    Usage

    CAProgressBar *checkProgress = [[CAProgressBar alloc] initWithFrame:CGRectMake(100, 100, 55, 20)]; checkProgress.hudColor =     UIColorFromRGB(0xF1F2F3); //[UIColor magentaColor]; [self.view addSubview:checkProgress];
    [checkProgress showAnimated:YES];

