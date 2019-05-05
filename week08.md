## Week8

本周内容：无监督学习，聚类和降维

### GitHub公式显示插件
github 的 markdown 不支持公式, 安装下面的 chrome 安装插件，可以正常看 markdown 文中的公式，当然前提是你需要过墙。

[github with mathjax](https://chrome.google.com/webstore/detail/github-with-mathjax/ioemnmodlmafdkllaclgeombjnmnbima)

## 8.1 无监督学习


### 8.1.1 聚类
- 把没有标签的数据分成组，寻找数据的结构。
- 常用算法有k-means

**K-means**

算法流程
- 随机初始化K个簇类中心
- 找出样本距离某个簇类中心最近的点，如此进行所有样本分簇
- 将所有已经分簇好的样本，计算簇的平均中心
- 将聚类中心移动到簇的平均中心
- 重复2，3，4步骤，直到簇的平均中心不在改变

伪代码算法流程
![伪代码流程](https://user-images.githubusercontent.com/41643043/56502421-d9563d80-6544-11e9-9001-e64d5b4fd4dc.png)

k-means应用
- 分开的簇和未分开的簇(比如衣服的型号S/M/L/XL)


**K-means目标优化**

失真代价函数(distortion cost function)

$$J(c^{1..m},\mu_{1..k})=\frac{1}{m} \sum^m_{i=1}||x^{(i)}-\mu_{c^{(i)}}||^2$$

目标优化
$$min\ J(c^{1..m},\mu_{1..k})$$

伪代码算法
- cluster assignment step 就是在做目标优化
- move centroid step 是选择目标优化后的中心点

随机初始化(推荐做法)
- K < m
- 随机挑选K个训练样本
- 设置$\mu_{1..K}$等于这K个样本

K-means存的问题

- 差的局部最优 local optima
    - 尝试多次随机初始化
    - 计算歧化损失函数，选择一个小的函数
    - k=2-10,比较好的
    - k比较大，随机初始化，不会得到太好的分类


怎么去选择K
- 肘部方法 elbow method
    - 计算K=1-10的损失函数，选择一个肘部
    - 如果看不出肘部点
- 根据后续下游目标进行选择K
    - 比如T桖尺寸分割，分成K=3或5



### 8.1.2 降维

数据压缩
- 直线$2D\ to\ 1D$，平面$3D\ to\ 2D$

数据可视化
- 数据压缩结束，将生成的新维度(这些维度一般不太容易理解其含义)，可以进行plot可视化
- 新维度一般是2维或者3维，易于可视化


分析数据相关性，这算进行降维？

**主成分分析PCA**

聚类常用的是k-means算法，降维常用PCA

定义
- 寻找低的新维度，使样本在新维度投影误差(projection error)只和最小化，不是投影距离(projection length)。

PCA和线性*回归*
- PCA不是线性回归
- 下图左边是线性回归，右边是pca(没有标签y)
- 两者的误差求法也不一样

- pca于线性模型的区别
    - pca是最小化投影的距离(点垂直于pca的平面)，x1，x2是平等的，没有predict只说
    - 线性模型是最小化predict和y之间最小化
    
![](https://user-images.githubusercontent.com/41643043/56542952-99be3e80-65a2-11e9-933c-9952964e5628.png)


**PCA算法**

数据预处理
- 特征幅度缩放和归一化

![](https://user-images.githubusercontent.com/41643043/56543898-73e66900-65a5-11e9-9cb3-50e94c640819.png)


协方差矩阵

![](https://user-images.githubusercontent.com/41643043/56543903-76e15980-65a5-11e9-91a3-323e262fd64c.png)

奇异
![](https://user-images.githubusercontent.com/41643043/56543904-76e15980-65a5-11e9-937a-107bb47cf526.png)







伪代码流程
![](https://user-images.githubusercontent.com/41643043/56543905-7779f000-65a5-11e9-8f1e-538c410f7936.png)





quiz
写octave中遇到
![](https://user-images.githubusercontent.com/41643043/56543909-7779f000-65a5-11e9-8503-062e6c7f440c.png)






PCA压缩数据维度到原始数据维度


怎样选择k，**肯定是要选择最小的k**

平均平方投影最小化

$$A=\frac{1}{m} \sum^m_{i=1} ||x^{(i)}-x^{(i)}_{approx}||^2$$

数据总变差

$$B =\frac{1}{m} \sum^m_{i=1}||x^{(i)}||^2$$

评判标准
$$\frac{A}{B} \leq 0.01$$

99%的差异性保存

差异性怎么理解？



&nbsp;

#### 伪代码选择k算法
![](https://user-images.githubusercontent.com/41643043/56545338-de99a380-65a9-11e9-923b-0e8887fe9644.png)

![](https://user-images.githubusercontent.com/41643043/56545339-df323a00-65a9-11e9-881d-aef0b7d92fff.png)


PCA提高监督学习速度

![](https://user-images.githubusercontent.com/41643043/56571143-e891c580-65ee-11e9-8630-dce130529d6d.png)


PCA的应用
- 压缩数据
    - 减少内存硬盘来存数据
    - 加速学习算法
- 可视化
    - k= 2 or 3

PCA的误区

- 使用pca去预防过拟合
    - pca降维后，特征更少了，真是数据更少了，不利于拟合
    - 推荐用正则化去预防过拟合

- 设置机器学习系统，直接使用pca
    - 不建议直接使用pca，
    - 建议使用原始数据后，如果用了原始没用，
        - 比如不收敛，比如占用内存太大
        - 才能建议去用pca













