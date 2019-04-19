## Week5

### 挣扎
这一章有些挣扎，尤其在看反向传播的时候，公式$\delta^{(3)}$如何得到的，完全一头雾水，有些要放弃的感觉，每天也不知道在干啥，晚上完全看不进去，如果搞不明白，可以不用出去了。吴老师的我基本没看懂，看了下面的才明白了。

补充学习B站3Blue1Brown
- [深度学习之反向传播算法 上](https://www.bilibili.com/video/av16577449)
- [深度学习之反向传播算法 下 公式推导](https://www.bilibili.com/video/av16577449/?p=2)

公式
![](https://user-images.githubusercontent.com/41643043/56329121-8e3ed200-61b4-11e9-8ccf-a4f6beb3266c.png)



### 神经网络：学习

分类问题，分类个数K
- $K = 2$，用一个神经元作为output layer即可
- $K \geq 3$，用K个神经元作为output layer

神经网络的log损失函数
- $J(\Theta) = -\frac{1}{m}[\sum^m_{i=1}\sum^K_{k=1} y^{(i)}_klog((h_\Theta(x^{(i)}))_k) + (1-y^{(i)}_k)log(1-(h_\Theta(x^{(i)}))_k)] + \frac{\lambda}{2m}\sum^{L-1}_{l=1}\sum^{s_l}_{i=1}\sum^{s_{l+1}}_{j=1}(\Theta^{(l)}_{ji})^2$
- 注意正则化怎么加起来的
- 注意$K \geq 3$和二分类的区别

&nbsp;
#### 反向传播
为什么有反向传播
- “反向传播”是用于最小化我们的成本函数的神经网络术语，就像我们在逻辑和线性回归中使用梯度下降一样。

##### 误差定义 $\delta_j^{(l)}$: "error" of node $j$ in layer $l$.

![](https://user-images.githubusercontent.com/41643043/56089754-55f47680-5eca-11e9-9a5b-2100a91f2070.png)

公式： **$\delta^{(3)}$不清楚，进一步学习**

$$\delta^{(4)}_j = a^{(4)}_j - y_i$$
$$\delta^{(3)} = (\Theta^{(3)})^T\theta^{(4)}.*g'(z^{(3)})$$
$$\delta^{(2)} = (\Theta^{(2)})^T\theta^{(3)}.*g'(z^{(2)})$$
$g'(z^{(3)}) = a^{(3)}.*(1-a^{(3)})$

没有第一层$\delta^{(1)}$，因为输入没有误差。

$\Delta^{(l)}_{ij}$用来计算偏导项


&nbsp;
#### 反向传播实战

解压参数
- 为了传入octave的 $fminunc$ 中使用，高级算法要求长向量模型参数



##### 梯度检查

为什么要做梯度检查
- 反向传播有一些bug，并且算法都不是运行的很好

使用反向传播，都会用检查梯度，增加信息


梯度下降使用小值参数约化进行下降测试(1e-4)
- 公式中采用近似进行计算

octave实现梯度检查算法

梯度检查算法
- 通过反向传播，计算出Dvec
- 通过梯度检查进行计算梯度近似值
- 确保上面两个梯度给出的值相同
- 关掉梯度检查，只通过反向传播学习
    - 梯度检查速度很慢

![](https://user-images.githubusercontent.com/41643043/56102305-cf3da900-5f5e-11e9-8429-57e078b7a6d2.png)

**随机初始化**

初始化$\Theta$
- 全 0 初始化








