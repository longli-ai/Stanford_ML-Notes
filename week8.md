## Week8


### GitHub公式显示插件
github 的 markdown 不支持公式, 安装下面的 chrome 安装插件，可以正常看 markdown 文中的公式，当然前提是你需要过墙。

[github with mathjax](https://chrome.google.com/webstore/detail/github-with-mathjax/ioemnmodlmafdkllaclgeombjnmnbima)

### 无监督学习


聚类
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

- 怎么去选择K
    - 肘部方法 elbow method
        - 计算K=1-10的损失函数，选择一个肘部
        - 如果看不出肘部点
    - 根据后续下游目标进行选择K
        - 比如T桖尺寸分割，分成K=3或5







