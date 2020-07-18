/// @description 待描述
///
/// @author 燕文强
///
/// @date 2020/7/16
class StateBo<T> {
  T data;
  UIState uiState;

  /// 默认完成状态
  StateBo(this.data, {this.uiState = UIState.completed});

  StateBo.loading() {
    this.uiState = UIState.loading;
  }

  StateBo.noNetwork() {
    this.uiState = UIState.noNetwork;
  }

  StateBo.networkPoor() {
    this.uiState = UIState.networkPoor;
  }

  StateBo.error() {
    this.uiState = UIState.error;
  }

  StateBo.noData() {
    this.uiState = UIState.noData;
  }
}

enum UIState {
  /// 无网络状态
  noNetwork,

  /// 网络差
  networkPoor,

  /// 加载中
  loading,

  /// 出错了
  error,

  /// 无数据
  noData,

  /// 完成预期
  completed,
}
