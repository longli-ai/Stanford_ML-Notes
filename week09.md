# Week9

本周内容：异常检测，推荐系统


## 异常检测

### 问题动机

- 偏斜类很严重，基本上没多少正样本可以获取
- 转向于采用寻找负样本的特征
- 然后把正样本作为异常点进行处理


### 异常检测

定义
- 经常用在无监督学习里，但是和有监督学习又很像
- 当有了一堆合格的训练样本之后
- 检测测试样本是不是异常

应用
- 欺诈检测检测异常用户
- 数据中心监控电脑
$p(x)< e$

### 高斯分布

公式

$$x \sim  N(\mu,\sigma^2)$$

$\sigma$ 标准差 standard deviation
- 表现出距离中心$\mu$的距离
- 距离越大，代表样本离中心越远

**参数计算**

$$\mu = \frac{1}{m}\sum^m_{(i=1)}x^{(i)}$$

$$\sigma^2=\frac{1}{m}\sum^m_{(i=1)}(x^{(i)}-\mu)^2$$



#### 9.1.3 高斯分布异常检测算法

概率密度评估

![](https://user-images.githubusercontent.com/41643043/56625024-d99e2800-666d-11e9-8bfe-226e843124a5.png)


高斯检测算法
![](https://user-images.githubusercontent.com/41643043/56625025-d99e2800-666d-11e9-81c3-66ff461a6f7f.png)



#### 9.1.4 高斯分布异常检测算法实施





#### 9.1.5 多元高斯分布

$$p(x;\mu,\Sigma)$$

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



### 9.2 推荐系统

#### 9.2.1 问题公式化




#### 9.2.2 基于内容推荐

<img width="1267" alt="reco" src="https://user-images.githubusercontent.com/41643043/57002835-e504cc80-6bf4-11e9-8c6c-785b65fe0326.png">

**基于内容的推荐(电影推荐系统)**
- 把电影看做样本，然后对电影进行特征(爱情和动作)向量化，得到每部电影的样本值
- 然后把用户打分当作label，进行线性回归训练，得到每个用户对应的特征权重
- 根据用户的权重，对用户没有打分的电影进行预测
- 根据预测打分进行推荐



<img width="991" alt="prob_for" src="https://user-images.githubusercontent.com/41643043/57002838-e6ce9000-6bf4-11e9-838f-aa3282f26781.png">

基本和线性回归类似
- 最小化目标函数


<img width="1155" alt="opt_gd" src="https://user-images.githubusercontent.com/41643043/57002841-e8985380-6bf4-11e9-992a-5eb09aecb225.png">

对所有用户进行目标函数最小化
- 并且进行梯度下降优化算法

#### 9.2.3 协同过滤

引入
- 上面的电影特征值是人为选择的，需要花时间去看完电影
- 如果人不知道的特征值怎么选



**推荐系统**
- 是根据电影样本的特征值 $x$，来计算用户的喜好(特征偏好)$\theta$

**计算特征值**
- 是根据用户的喜好(特征偏好) $\theta$ 来计算每个电影的特征值 $x$
- 用户的特征偏好$\theta$，基本可以收集，用户会告诉网站，或者通过几部电影，已经计算出来了
- 从多个用户的喜好特征，从而得到新电影的特征值

<img width="1261" alt="example" src="https://user-images.githubusercontent.com/41643043/57003513-e389d300-6bf9-11e9-8e34-62785d74eaaf.png">

**计算特征优化目标**

<img width="1082" alt="co_alg" src="https://user-images.githubusercontent.com/41643043/57003258-e5eb2d80-6bf7-11e9-9326-ce2b648b83a3.png">

**协同过滤**
- 基于内容推荐
- 基于计算特征

<img width="1102" alt="col_alg2" src="https://user-images.githubusercontent.com/41643043/57003259-e71c5a80-6bf7-11e9-9dbb-852b2a2367ea.png">


#### 9.2.4 协同过滤算法

**优化目标**


<img width="453" alt="opt" src="https://user-images.githubusercontent.com/41643043/57003943-f94cc780-6bfc-11e9-8f2e-2fd4e620bddd.png">


<img width="463" alt="co_alg" src="https://user-images.githubusercontent.com/41643043/57003945-f9e55e00-6bfc-11e9-8df6-0c927e387c3e.png">


#### 9.2.5 矢量化：低轶矩阵分解


[机器学习——低秩矩阵分解中低秩的意义、矩阵填补、交叉验证](https://blog.csdn.net/manduner/article/details/80564414)


低轶矩阵分解
- 矩阵填补，自动填补某些缺失值


<img width="445" alt="lr" src="https://user-images.githubusercontent.com/41643043/57004274-3cf50080-6c00-11e9-9539-6b31f5ab7385.png">



相似商品推荐
- 首先计算出所有商品的特征值
- 计算两个商品的相似度 $||x^{(i)}-x^{(j)}||$
- 选择最小的几个商品进行推荐

<img width="504" alt="similar" src="https://user-images.githubusercontent.com/41643043/57004166-4a5dbb00-6bff-11e9-8d9e-e48009acc402.png">


#### 9.2.6 实施细节：均值规范化

用户初始化(冷启动)
- 采用优化目标，可能使用户的喜好偏好 $\theta = [0\ 0]$
- 对矩阵$Y$，对每行求平均，进行均值规范化，得到新的$Y$
- 均值的意义，就是用来冷启动用户

<img width="457" alt="m_norm" src="https://user-images.githubusercontent.com/41643043/57004442-99a4eb00-6c01-11e9-872d-c47dd82700c2.png">


















