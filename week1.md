##  Week 1

### Introduction

##### 机器学习定义

- 一个程序能从经验e中学习，并且**性能度量p**认为改善了解决t问题的性能。



##### 机器学习分类

- 无监督学习，有监督学习，强化学习，推荐系统
- 将算法应用于解决实际问题中



##### 监督学习

- 定义：部分数据集已经有正确答案了，有数据集标签label
- 算法：线性回归，逻辑回归，深度学习，svm
- 解决问题
    - 回归问题（输出连续值）
        - 我们正在尝试将输入变量映射到某个连续函数。
    - 分类问题（输出离散值）
        - 我们试图在离散输出中预测结果
- svm能解决很多特征的问题
    - 特征维度很高



##### 无监督学习

- 定义：数据集没有标签，或者是聚类算法
    - 无监督学习使我们能够在很少或根本不知道我们的结果应该是什么样的情况下处理问题。
    - 在无监督学习的情况下，没有基于预测结果的反馈。
- 算法：降维，聚类



### Model and Cost Function

##### 线性回归模型结构

- Hypothesis
    - $h_{\theta}(x)= \theta_0 + \theta_1x$
- Parameters
    - $\theta_0, \theta_1$
- Cost Function
    - $J(\theta_0,\theta_1) = \frac{1}{2m}\sum_{i=1}^{m}(h_{\theta}(x^{(i)}-y^{(i)}))^2$
- Goal: $minimize_{\theta_0,\theta_1}  J(\theta_0,\theta_1)$



##### hypothesis 假设函数(h)

![model_rep](https://user-images.githubusercontent.com/41643043/55610898-82b3da00-57b6-11e9-8224-14c94a4de67e.png)



##### 损失函数/代价函数

- 定义：假设函数的所有样本的预测结果和实际结果之间的平均差异
- 线性模型：平方误差函数/mse
    - $J(\theta_0,\theta_1) = \frac{1}{2m}\sum_{i=1}^{m}(h_{\theta}(x^{(i)}-y^{(i)}))^2$
- 根据损失函数图像来寻找最佳参数，比如二次函数的最低点



### Parameter Learning

##### 梯度下降

- 随机一下$\theta_0,\theta_1​$
- 通过持续更新$\theta_0,\theta_1$来最小化损失函数
- **同时间**更新$\theta_0,\theta_1$

![pm_update](https://user-images.githubusercontent.com/41643043/55610899-82b3da00-57b6-11e9-9453-92050b531d6d.png)



##### 梯度下降算法- $\theta$更新

repeat until covergence {
	$\theta_j := \theta_j -\alpha \frac{\partial}{\partial \theta_j}J(\theta_0,\theta_1)$
}



##### 参数更新(左，右)

![](https://user-images.githubusercontent.com/41643043/55611138-40d76380-57b7-11e9-9536-7c438bd3acab.png)



##### 学习率不变

![](https://user-images.githubusercontent.com/41643043/55611137-403ecd00-57b7-11e9-9b4d-220ac273d6c2.png)

##### 梯度下降更新

![](https://user-images.githubusercontent.com/41643043/55611139-40d76380-57b7-11e9-85d0-97a9e5271f5a.png)



#### Batch Gradient Descent

- 训练时候，使用整个样本
- min-batch，使用部分样本



### Linear Algebra Review



matrix大小

- row * column
- 不服从结合律

vector

- n x 1matrix
- n-dimensional vector

预测结果（octave）

- prediction = DataMatrix * Parameters



单位矩阵 Identical matrix

- 对角1，其他位置位0
- $A I = I A = A $(服从结合律)



逆矩阵 matrix inverse

- $AA^{-1} = A^{-1}A = I$
- 奇异军阵/退化矩阵 
    - 定义：无逆矩阵

转置矩阵 matrix transpose

- 右手掌向上，手掌水平于胸，指尖向左
- 翻手，手掌向下，指尖垂直于胸向前
- 转置矩阵的元素就是这样过来的


