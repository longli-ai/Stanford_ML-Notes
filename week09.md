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

创建一个推荐系统

异常检测和监督学习使用
- 异常检测应用
    - 偏斜类很严重，基本上没多少正样本可以获取
    - 转向于采用寻找负样本的特征
    - 然后把正样本作为异常点进行处理


异常检测使用什么特征
- 非高斯分布特征分布(长尾分布)
    - 使用$hist(x)$，看看样本的分布情况，是不是高斯分布
    - 转换特征成高斯分布，比如采用$log(x), log(x+c), x^{\frac{1}{2}}$


多元高斯分布例子

![](https://user-images.githubusercontent.com/41643043/56625531-529e7f00-6670-11e9-90bc-44123c42425f.png)

![](https://user-images.githubusercontent.com/41643043/56625642-d8222f00-6670-11e9-8768-30124a246888.png)


![](https://user-images.githubusercontent.com/41643043/56625643-d8222f00-6670-11e9-927b-d29f39739e58.png)

异常检测采用多元高斯分布

原始的高斯分布，对应的多元高斯分布

![](https://user-images.githubusercontent.com/41643043/56843988-4e29ce80-68db-11e9-8c42-2b112886226d.png)

使用多元高斯分布，如果不可解奇异矩阵
- 样本m < 特征n
- 冗余的特征，比如两个特征相等

![](https://user-images.githubusercontent.com/41643043/56844053-d9f02a80-68dc-11e9-82cb-8e08d1343a46.png)



## 9.2 推荐系统








