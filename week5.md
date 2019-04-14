## Week5

### 神经网络：学习

分类问题，分类个数K
- $K = 2$，用一个神经元作为output layer即可
- $K \geq 3$，用K个神经元作为output layer

神经网络的log损失函数
- $J(\Theta) = -\frac{1}{m}[\sum^m_{i=1}\sum^K_{k=1} y^{(i)}_klog((h_\Theta(x^{(i)}))_k) + (1-y^{(i)}_k)log(1-(h_\Theta(x^{(i)}))_k)] + \frac{\lambda}{2m}\sum^{L-1}_{l=1}\sum^{s_l}_{i=1}\sum^{s_{l+1}}_{j=1}(\Theta^{(l)}_{ji})^2$
- 注意正则化怎么加起来的
- 注意$K \geq 3$和二分类的区别



#### 反向传播

##### 误差定义 $\delta_j^{(l)}$: "error" of node $j$ in layer $l$.

![](https://user-images.githubusercontent.com/41643043/56089754-55f47680-5eca-11e9-9a5b-2100a91f2070.png)

$\delta^{(3)}$不清楚，进一步学习


