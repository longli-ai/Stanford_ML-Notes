## Week2



### Multivariate Linear Regression

#### Multiple Features 多元特征

- 假设函数 $h_\theta(x) = \theta_0x_0+\theta_1x_1+…+\theta_nx_n$

- $h_\theta(x) = \theta^TX$
- $\theta$是细数，表示权重，一般不要讲x放在前面。



#### 多元参数的梯度下降
多元参数和week1的梯度下降一样，将$x_0 = 1$带入week1即可
repeat until covergence {
    $\theta_j := \theta_j -\alpha \frac{\partial}{\partial \theta_j}J(\theta_j)$ $for\ j := 0...n$
}


#### 梯度下降实战1-Feature Scaling
核心思想：确保特征们都在相似的幅度

- feature scaling 特征缩放
    - 太大或者**太小（0.001）**的数字，都需要幅度缩放，接近$-1< x< 1$一般不用缩放

- Mean normalization 归一化
    - 减去均值，再除以标准差$\frac{x_i - \mu_i}{std(x_i)}​$
    - $\mu = mean(x)$

为什么特征缩放
- 不采用缩放，比如形成一个瘦长的损失函数图，梯度下降再瘦子的方向，会震荡式下降比较慢
- 好处是梯度下降下降的更快，下降收敛所需要的迭代次数更少
![](<https://user-images.githubusercontent.com/41643043/55670396-423b8580-58b6-11e9-9655-fd294ddedb75.png>)


#### 梯度下降实战2-Learning Rate
$J(\theta)-Iterations$曲线
![](https://user-images.githubusercontent.com/41643043/55677310-dbe74f00-5917-11e9-890d-95ff3f06c054.png)

根据$J(\theta)-Iterations$曲线的走向，进行调整学习率的大小
- 曲线很难收敛，但不抖动，可以考虑提高学习率
- 曲线跳跃，可以考虑降低学习率
![](https://user-images.githubusercontent.com/41643043/55677312-ddb11280-5917-11e9-9042-e2dca3eb036a.png)


#### 特征和多项式回归
如果直线不能拟合，我们可以通过添加多项式进行拟合，比如改成二次，三次，或者平方根的形式等等



### Computing Parameters Analytically

#### 正规方程 Normal Equation
- 定义：$\theta = (X^T X)^{-1}X^Ty$
- 解方程$(X^T X)^{-1}$的复杂度是$O(n^3)$
- 用不用这个方程，要看问题的特征多不多，如果特征维度n<1000，正常计算机可以计算这样的矩阵。
- 但特征维度一旦增加，比如电商的推荐系统，很多是上亿维度的稀疏向量

![](https://user-images.githubusercontent.com/41643043/55677705-37690b00-591f-11e9-8a46-e1bf57fd3696.png)

#### Normal Equation Noninvertibility
正规方程$(X^T X)^{-1}$不可逆，怎么办
- 删除冗余的特征（线性依赖的特征）
- 太多特征（样本数量小于特征数量）
    - 删除一些特征，或者用正则化

octave中正规方程$(X^T X)^{-1}$不可逆
- inv()没有解
- pinv()可以求一个伪逆矩阵，所以常用pinv()


### Octave/Matlab Tutorial

```octave
eye # 生成单位矩阵
format long #长型
format short # 短型

load featuresX.dat # 生成featruesX
load priceY.dat # 生成priceY
who # 查看所有已经定义的变量名字
whos # 详细查看已经定义的变量名

clear featuresX # 清除变量
v = priceY(1:10) 
save hello.dat v; # 保存v到hello.dat

A = [1 2;3 4; 5 6]
save hello.txt -ascii %save as text # %是注释
size(A) # shape of matrix A

length(A) # 矩阵的长度

```


```octave
A * C # 点乘
A .* B # A, B必须一样大小的矩阵，结果是内部元素相乘
A .^ 2 # A的所有元素平方一下
A^2 # A * A
1 ./ A # A中的元素倒数
A' #  A.T 转置

A < 3 # 输出真值表，类似pandas
max(A,[],1) #  筛选column 最大元素
max(A,[],2) # 筛选row 最大元素
max(A) # 筛选column 最大元素
max(max(A)) # 求矩阵最大
sum(A,1) # sum column
sum(A,2) # sum row

```

#### 向量化
将参数更新向量化
![](https://user-images.githubusercontent.com/41643043/55678730-245f3680-5931-11e9-91db-d487d4d5230a.png)


### 编程
- octave的使用，作业题目是手写 **梯度下降**，值得注意的区分就是$X'*\theta$还是$\theta*X$
- 切记：octave与其他的语言不同，采用1-n到多少，其他语言基本都是0-n，比如矩阵A[:,1:2]代表第1列，第2列