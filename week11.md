## Week11

### GitHub公式显示插件
Github 的 markdown 不支持数学公式, 安装下面的 chrome 安装 mathjax 插件，可以正常看 markdown 文中的数学公式，当然前提是你需要过墙，才能安装。


[Github with mathjax](https://chrome.google.com/webstore/detail/github-with-mathjax/ioemnmodlmafdkllaclgeombjnmnbima)


### 11.1 照片光学字符识别 Photo OCR


#### 11.1.1 Photo OCR问题和pipeline

photo OCR 任务
- 读取出照片中拍摄到的文字信息，比如用文字搜索图片

- 文字在什么位置
- 文字是什么

应用
- 帮助盲人读书，自动导航驾驶


Photo OCR 流水线 pipeline
- 文本识别
- 字符分割
- 字符分类

![](https://user-images.githubusercontent.com/41643043/56883395-23857480-6a99-11e9-9a48-02a9dfc0c90f.png)




#### 11.1.2 滑动窗 Sliding Window



路上行人怎么抓取
- 采用滑动窗口，定义大小和步长，从前到后遍历一边
- 将抓到的人的滑动窗口图片返回，压缩成图片送入 **分类器** 输入大小，判断是不是人

文本检测怎么做
- 首先检测每个滑动窗口中是不是文字，是的话返回亮色，不会返回暗色
- 展开器对亮色做extent，去掉高比宽大的白色区域

字符分割
- 分割出的图片，如果中间可用一根线分割，代表切分在两个样本中间
- 切错的样本代表正样本，切分成功的样本是负样本


图片字母识别
- 分类器

![](https://user-images.githubusercontent.com/41643043/56884798-72350d80-6a9d-11e9-86b3-e5266eb53255.png)



#### 11.1.3 数据扩增


图片样本扩增
- 背景扭曲
- 旋转
- 噪声


声音样本扩增
- 机房噪声
- 背景噪声
- 坏电话噪声

无用的数据扩增
- 图片增加纯随机的噪声，比如高斯随机噪声没有作用


关于数据扩增
- 扩增之前，确保模型的低偏差，不要欠拟合

![](https://user-images.githubusercontent.com/41643043/56887159-68160d80-6aa3-11e9-9b72-27c433b18da1.png)



#### 11.1.4 上限分析 ceiling analysis

**时间是宝贵的**

上限分析帮助你寻找最应该花时间improve的模块上


pipeline上的组块分析
- 将前面的组块一一理想化，将label作为下一层的输入，查看系统准确度
- 寻找整个pipeline上组块的短板，将时间花在上面


![](https://user-images.githubusercontent.com/41643043/56888178-fbe8d900-6aa5-11e9-8d51-a30c5467c344.png)


**上限分析例子2：人脸识别**

![](https://user-images.githubusercontent.com/41643043/56888182-fe4b3300-6aa5-11e9-80c9-1722325f7824.png)


![](https://user-images.githubusercontent.com/41643043/56888179-fd1a0600-6aa5-11e9-8f73-a1d9aa044063.png)


### 11.2 课程总结

![](https://user-images.githubusercontent.com/41643043/56889535-2e480580-6aa9-11e9-8641-7c2b02047e8e.png)

感谢吴恩达老师