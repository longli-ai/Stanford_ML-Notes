# Week3 逻辑回归和正则化

## 补充 矩阵方程

课程中，所有向量表示都是列向量，比如单样本的特征$x^{(i)}, \theta$
$$h_{\theta}(x)=g(\theta^T*x)$$


**假设函数**

$$h(\theta)=g(X*\theta);$$

**损失函数**

$$J(\theta)= \frac{1}{m}[y'*log(h(\theta))+(1-y)'*log(1-h(\theta))]; $$


### 比较两种假设函数

**假设函数$h_{\theta}(x)$**
- 在特定$\theta$下，计算单样本$x$的预测结果
    - 输出$y$是标量，这时候计算输出的，就只能是 $\theta^T*x$ 或者 $x^T*\theta$
    - 由于不是神经网络，所以此时只能做二分类
- 此时$h_{\theta}(x)$输出结果为标量

&nbsp;
**假设函数$h(\theta)$**

$$h(\theta)=g(X*\theta);$$

- 表示全样本的情况下，$\theta$的方程，求全样本的向量化$y$的方程，此时$X$代表已知全样本矩阵。
- 此时$h(\theta)$输出结果为向量化$y$

**损失函数偏导的意义**

$$\frac{\partial J(\theta)}{\partial\theta_j}
= \frac{1}{m} \sum^m_{i=1} (h_\theta(x^{(i)}) - y^{(i)})x^{(i)}_j$$

- 通过观察公式，可以发现对整个样本的误差，乘以自身的某个特征值，然后求平均
- 就能得到需要对某个特征的权重需要更新的大小

**损失函数偏导数**

- 通过上面的公式观察，可以得到下面公式

$$\frac{\partial J(\theta)}{\partial\theta_j}
= \frac{1}{m} X(:,j)'*(h(\theta)-y) \tag{1}$$

$$\frac{\partial J(\theta)}{\partial\theta}
= \frac{1}{m} X'*(h(\theta)-y) \tag{2}$$

## 逻辑回归

#### 分类算法和表征


##### 引入：线性回归讲述如何做恶性肿瘤分类问题

- 以癌症分类开始，如果有异常点，会将线性回归的线拉偏，从而导致接近0.5的恶性肿瘤预测失败
- 正常恶性肿瘤分类，其要求输出结果不是0，就是1
    - 但是如果采用线性回归假设函数，$h >> 1$ 或者$h << 0$，这样比较奇怪



##### 逻辑回归模型

引入假设函数希望 $0 \leq h_{\theta}(x) \leq 1$
- $h_{\theta}(x) = g(\theta^Tx)=\frac{1}{1+e^{- \theta^Tx}}​$
    - g()逻辑函数或者sigmoid函数
- $h_{\theta}(x) = P(y=1|x;\theta)​$



##### 决策边界

- $h_{\theta}(x) = g(\theta^Tx)$
    - $y = 1; \theta^Tx \geq 0$
    - $y = 0; \theta^Tx < 0​$
- 决策边界是假设函数及其参数的属性，不是数据集的属性
    - 数据集只是用来调整更新拟合参数的
- 同样适用于非线形的决策边界（多项式）



#### 逻辑回归模型



##### 损失函数

引入：线性回归的损失函数，样本的平均

- 线性回归的单个代价函数$cost(h_\theta(x),y)= \frac{1}{2} (h_\theta(x) - y)^2$
- 如果逻辑回归采用上面的损失函数，将不是凸函数，其中$h_{\theta}(x) = g(\theta^Tx)$
- 所以进一步准备更改损失函数，来保证损失函数是凸函数，才能找到全局最低点



##### log代价函数
$$ cost(h_\theta(x),y)=\left\{
\begin{aligned}
-log(h_\theta(x));\ if\ y = 1 \\
-log(1-h_\theta(x));\ if\ y = 0
\end{aligned}
\right.
$$



##### 代价函数(y=1)

![](https://user-images.githubusercontent.com/41643043/55682244-7faa1c80-5963-11e9-9459-34c480961fae.png)



##### 代价函数(y=0)

![](https://user-images.githubusercontent.com/41643043/55682245-8042b300-5963-11e9-8592-d79168155c17.png)



##### 简化log代价函数

$$cost(h_\theta(x),y) = -y*log(h_\theta(x)) - (1-y)*log(1-h_\theta(x))$$



##### 逻辑回归损失函数（总损失函数）

$$J(\theta) = -\frac{1}{m}[y*log(h_\theta(x)) + (1-y)*log(1-h_\theta(x))]$$



##### 梯度下降算法

更新公式和线性回归一样，但其中假设函数$h_\theta(x)$变化了

$repeat\ until\ covergence\ \{​$
$$\theta_j := \theta_j -\alpha \frac{\partial}{\partial \theta_j}J(\theta_j);\ for\ j := 0...n​$$
$\}​$



##### 其他高级优化算法

只需要知道，其他的不需要花时间，后续添加SGD/BGD/mini-BGD

![](https://user-images.githubusercontent.com/41643043/55684287-18e52d00-597c-11e9-8e39-e75f5cf2eef8.png)

octave中实现
![](https://user-images.githubusercontent.com/41643043/55684311-547ff700-597c-11e9-9507-b9b5a2aa7c42.png)



#### 多分类


one vs one

- 只区分第一类和第二类，无视第三类



one vs rest

- 区分第一类，和非第一类
多分类最后的输出结果，选择3个分类器中输出概率最高的为输出结果



### 正则化



#### 过拟合和欠拟合

##### 高偏差high bias/欠拟合
- 学习算法有很强的偏见/很强的偏差，无视数据事实/证据，仍用现在model来进行拟合

##### 高方差high variance/过拟合
- 假设函数能拟合所有的数据，就是函数太过庞大，变量太多。
- 没有足够的数据来约束假设函数
- 在一般数据上泛化能力太差



容易出现过拟合情况

- 数据特征维度过多，数据集又不多，容易导致过拟合



#### 过拟合的解决方法



##### 解决过拟合的两个方法

降低特征的数量
- 手工选择特征
- 让model自己选择，后面会讲
- 但是有缺点：扔掉某些特征，就是扔掉了一些信息，有可能有用

正则化解决上面短板
- 保留所有特征，但是降低参数数值的大小的影响



##### 损失函数

$$min_\theta\ \frac{1}{2m}[\sum_{i=1}^m(h_\theta(x^{(i)})-y^{(i)})^2+\lambda\sum_{i=1}^n\theta_{j}^2] \tag{1}$$ 

核心思想
- 对于小数值的参数$\theta_0,\theta_1\theta_2,...,\theta_n$
    - 采用更简单的假设函数去去处小值的影响
    - 更不容易的过拟合

正则化系数$\lambda$两个作用
- 使假设更好fit训练集
- 保持参数$\theta$小

$\lambda$太大可能导致 underfitting
正则化项并不惩罚$\theta_0$

##### 线性回归的正则化

梯度下降中的正则化
![](https://user-images.githubusercontent.com/41643043/55685500-9e230e80-5989-11e9-83e2-2dbd08424402.png)


正规方程解的正则化
![](https://user-images.githubusercontent.com/41643043/55685501-9e230e80-5989-11e9-8417-8f4ea1518286.png)
- 可以讲不可逆的矩阵加上正则化，矩阵变的可逆了


##### 逻辑回归的正则化

正则化的log损失函数
![re_lr](https://user-images.githubusercontent.com/41643043/55692855-3814a680-59de-11e9-9213-db917a38f949.png)

正则化的梯度下降
![lr_gd](https://user-images.githubusercontent.com/41643043/55692854-3814a680-59de-11e9-9f4b-1aa0e2ec9b65.png)




