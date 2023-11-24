from collections import deque

class Graph:
    def __init__(self):
        self.graph = {}

    def add_edge(self, node, neighbors):
        self.graph[node] = neighbors

    def bfs(self, start):
        visited = set()
        queue = deque([start])

        while queue:
            current_node = queue.popleft()
            if current_node not in visited:
                print(current_node, end=" ")
                visited.add(current_node)
                queue.extend(neighbor for neighbor in self.graph[current_node] if neighbor not in visited)

def main():
    # Create a sample graph
    sample_graph = Graph()
    sample_graph.add_edge('A', ['B', 'C'])
    sample_graph.add_edge('B', ['D', 'E'])
    sample_graph.add_edge('C', [5])
    sample_graph.add_edge('D', [])
    sample_graph.add_edge('E', ['F'])
    sample_graph.add_edge('F', [])

    start_node = 'A'

    print("BFS Traversal:")
    sample_graph.bfs(start_node)

if __name__ == "__main__":
    main()
