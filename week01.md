#  Week1

本周内容：1.机器学习简介，2.单变量线性回归，3.线性代数



## 1. 机器学习简介

#### 1.1 机器学习定义

程序能从经验E中学习，并且**性能度量P**认为改善了解决问题T的性能。

#### 1.2 机器学习分类

无监督学习，有监督学习，强化学习，推荐系统


#### 1.3 监督学习

**定义**
- 部分数据集已经有正确答案了，即有数据集标签
- 标签作用：对学习过程的预测结果的反馈

**解决问题**
- 回归问题（输出连续值）
    - 正在尝试将输入变量映射到某个连续函数。
- 分类问题（输出离散值）
    - 我们试图在离散输出中预测结果


**常用算法**
- 线性回归，逻辑回归，深度学习，支持向量机
- 回归问题，分类问题（线性回归基础上），深度学习（逻辑回归模型泛化），支持向量机（大间距分类器）



支持向量机 `SVM` 能解决样本特征多的问题
- 特征比样本数量多
- 样本特征维度很高，稀疏向量

#### 1.4 无监督学习

定义：数据集没有标签
- 无监督学习使我们能够在很少或根本不知道我们的结果应该是什么样的情况下处理问题。
- 在无监督学习的情况下，没有基于预测结果的反馈。

常用算法
- 降维，聚类，异常检测

&nbsp;
## 2. 单变量的线性回归

### 2.1 线性回归结构


![](https://user-images.githubusercontent.com/41643043/56453801-1c17ea00-637a-11e9-9110-eaeb81097582.png)

假设函数 `Hypothesis`

$$h_{\theta}(x)= \theta_0 + \theta_1x$$

学习参数 `Parameters`

$$\theta_0, \theta_1$$

损失函数 `Cost Function`

$$J(\theta_0,\theta_1) = \frac{1}{2m}\sum_{i=1}^{m}(h_{\theta}(x^{(i)})-y^{(i)})^2$$

优化目标 `Goal`

$$min_{\theta_0,\theta_1}  J(\theta_0,\theta_1)$$




#### 损失函数/代价函数

&nbsp;
损失函数定义

- 假设函数的所有样本的预测结果和实际结果之间的平均差异

&nbsp;
线性回归的损失函数
- 平方误差函数/mse
$$J(\theta_0,\theta_1) = \frac{1}{2m}\sum_{i=1}^{m}(h_{\theta}(x^{(i)})-y^{(i)})^2$$

&nbsp;
优化损失函数
- 根据损失函数图像来寻找最佳参数，比如二次函数的最低点


#### 梯度下降

- 随机一下$\theta_0,\theta_1​$
- 通过持续更新$\theta_0,\theta_1$来最小化损失函数
- **同时**更新$\theta_0,\theta_1$

![pm_update](https://user-images.githubusercontent.com/41643043/56453802-1cb08080-637a-11e9-8691-718ce8483908.png)



#### 梯度下降算法 $\theta$ 更新

$repeat\ until\ covergence\ \{$
	$\theta_j := \theta_j -\alpha \frac{\partial}{\partial \theta_j}J(\theta_0,\theta_1)$
$\}$


#### 参数更新

![](https://user-images.githubusercontent.com/41643043/55611138-40d76380-57b7-11e9-9536-7c438bd3acab.png)



#### 学习率不变

学习率比较小
- 收敛速度慢

学习率比较大
- 可能出现震荡，学习曲线甚至不收敛

![](https://user-images.githubusercontent.com/41643043/55611137-403ecd00-57b7-11e9-9b4d-220ac273d6c2.png)

#### 梯度下降更新

![](https://user-images.githubusercontent.com/41643043/55611139-40d76380-57b7-11e9-85d0-97a9e5271f5a.png)



#### 批次梯度下降

- 使用整个样本 `batch`
- 使用部分样本 `min-batch`


&nbsp;
## 3.线性代数

**矩阵 `shape` 定义**
- 行 x 列

**列向量**
- $n$ x $1$ 矩阵
- $n$维向量

**预测`Octave`公式**

- `prediction = DataMatrix * Parameters`


**单位矩阵 `Identical matrix`**

- 对角1，其他位置位0
- $A I = I A = A $(服从结合律)



**逆矩阵 `matrix inverse`**

- $AA^{-1} = A^{-1}A = I$
- 奇异军阵/退化矩阵 
    - 定义：无逆矩阵

**转置矩阵 `matrix transpose`**

- 矩阵翻转90度



