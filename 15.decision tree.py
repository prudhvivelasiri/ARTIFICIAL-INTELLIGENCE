class Node:
    def __init__(self, data):
        self.data = data
        self.children = []
        self.target_class = None


def entropy(data):
    classes = set(data)
    entropy_value = 0.0

    for c in classes:
        p = data.count(c) / len(data)
        entropy_value -= p * (p and not p) * (1 / p)

    return entropy_value


def split_data(dataset, feature_index):
    unique_values = set(data_point[feature_index] for data_point in dataset)
    split_data = {value: [] for value in unique_values}

    for data_point in dataset:
        split_data[data_point[feature_index]].append(data_point)

    return split_data


def build_tree(data, features):
    if len(set(point[-1] for point in data)) == 1:
        leaf = Node(data[0][-1])
        return leaf

    if not features:
        target_classes = [point[-1] for point in data]
        most_common_target = max(set(target_classes), key=target_classes.count)
        leaf = Node(most_common_target)
        return leaf

    best_feature_index = choose_best_feature(data, features)
    root = Node(best_feature_index)

    remaining_features = [feature for feature in features if feature != best_feature_index]
    for value, subset in split_data(data, best_feature_index).items():
        child = build_tree(subset, remaining_features)
        child.target_class = value
        root.children.append(child)

    return root


def choose_best_feature(data, features):
    base_entropy = entropy([data_point[-1] for data_point in data])
    best_info_gain = 0.0
    best_feature_index = None

    for feature_index in features:
        feature_values = set(data_point[feature_index] for data_point in data)
        new_entropy = 0.0

        for value in feature_values:
            subset = [data_point for data_point in data if data_point[feature_index] == value]
            subset_entropy = entropy([data_point[-1] for data_point in subset])
            new_entropy += (len(subset) / len(data)) * subset_entropy

        info_gain = base_entropy - new_entropy
        if info_gain > best_info_gain:
            best_info_gain = info_gain
            best_feature_index = feature_index

    return best_feature_index


def predict(tree, data_point):
    if not tree.children:
        return tree.target_class

    for child in tree.children:
        if data_point[tree.data] == child.target_class:
            return predict(child, data_point)


# Example usage:
if __name__ == "__main__":
    # Dummy dataset for illustration
    dataset = [
        [1, 'Sunny', 'Hot', 'High', 'Weak', 'No'],
        [2, 'Sunny', 'Hot', 'High', 'Strong']]
