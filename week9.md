# Week9


### GitHub公式显示插件
github 的 markdown 不支持公式, 安装下面的 chrome 安装插件，可以正常看 markdown 文中的公式，当然前提是你需要过墙。

[github with mathjax](https://chrome.google.com/webstore/detail/github-with-mathjax/ioemnmodlmafdkllaclgeombjnmnbima)


## 9.1 异常检测

**9.1.1 异常检测**

定义
- 经常用在无监督学习里，但是和有监督学习又很像
- 当有了一堆合格的训练样本之后
- 检测测试样本是不是异常

应用
- 欺诈检测检测异常用户
- 数据中心监控电脑
$p(x)< e$

**9.1.2 高斯分布**

公式
$$x ~  N(\mu,\sigma^2)$$

$\sigma$标准差standard deviation
- 表现出距离中心$\mu$的距离
- 距离越大，代表样本离中心越远

参数计算

$\mu = \frac{1}{m}\sum^m_{(i=1)}x^{(i)}$

$\sigma^2=\frac{1}{m}\sum^m_{(i=1)}(x^{(i)}-\mu)^2$

**9.1.3 高斯检测算法**

概率密度评估

![](https://user-images.githubusercontent.com/41643043/56625024-d99e2800-666d-11e9-8bfe-226e843124a5.png)


高斯检测算法
![](https://user-images.githubusercontent.com/41643043/56625025-d99e2800-666d-11e9-81c3-66ff461a6f7f.png)



**9.1.4 高斯检测算法**





**9.1.5 多元高斯分布**

$$p(x;\mu,\Sigma) = $$

$\Sigma$协方差矩阵

定义
![](https://user-images.githubusercontent.com/41643043/56625343-78775400-666f-11e9-90a0-8e5bb9759e5a.png)

与多个p相乘的区别
- 多个p不是多元高斯分布，他们各自服从自己的分布
- 多元分布，all in one function



矩阵行列式octave计算
- det(Sigma)

多元高斯分布例子

![](https://user-images.githubusercontent.com/41643043/56625531-529e7f00-6670-11e9-90bc-44123c42425f.png)

![](https://user-images.githubusercontent.com/41643043/56625642-d8222f00-6670-11e9-8768-30124a246888.png)


![](https://user-images.githubusercontent.com/41643043/56625643-d8222f00-6670-11e9-927b-d29f39739e58.png)



## 9.2 推荐系统

